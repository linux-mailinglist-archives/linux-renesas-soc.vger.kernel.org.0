Return-Path: <linux-renesas-soc+bounces-33284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NUXLiJJGGpSiggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 15:54:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 398205F324E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 15:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3606131354C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 13:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348472690EC;
	Thu, 28 May 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sP2BicN5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1195273D8F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976081; cv=none; b=ZpbcDDDVYTqPRZdRCAIF9Ty4HnV8l7DbEELFZ4sC/E6O8DJNuBsVjOeel8qgHfTpybPq5rCzCL4Ic8H6S3yeJ1y8WFwM/cx/APVhU+8F4htkiqmnUgziz+V2pzfXACrmQ+qVZJJcWnlr+S0zBe1alrbbrXl+0yuKBytSzf39V0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976081; c=relaxed/simple;
	bh=pyCtv10ijCOcr7f6tZE2tbiH0NqoXM+39cgvEB2x8x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AvUYjEshkEky8XziQcLC1IFbnnu6bKVI3Jpzb0/x3khBgqu0ba2vlpzTArM4dwTfdb6rix4iN8EVSGP9VszmNfRY7DnMh0Zr9y1nGy3hafMc7oadJHvvHHI0Fpz/d696dccOhbNE3f67pww8piB7hu3WfaxCyM5jU3AdLx+XOyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sP2BicN5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ed18d8a1bso2181230f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976078; x=1780580878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kJ10VKSFyd/Jmp3siR/rxDjNdmAJhBNWorD0nlZLNM=;
        b=sP2BicN5Ox9ulim6ViU235WeZdfFZMV/oyoLykPuml/G1iyZzfsjn+AZXFJBt/H+h2
         ZbsMyV77nE6ri9UzwisUjVpTlKtbyC6zymfpsAOSbz3XqmoIYEFOAKXx+7etoP7TZs2B
         jgz65fbQVOtHILGNQ3UnPBvjkHhwElu8c2gpCM6o5Qjx7CuRL0bgwnoaY7aWbmAFjb5l
         QuHpcuMzmfdLk4r1QqzyGZ+A/FQfmbwybfLW9+fPNPwtaiBIujHySuDMzFEE7uzIekLm
         9HEW2u3X3AfQA8gGt6VQ70/F9YyJfefay4RKmj5nrcOLNkX+ASdXmIqmhSiaQixBM8CS
         q3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976078; x=1780580878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kJ10VKSFyd/Jmp3siR/rxDjNdmAJhBNWorD0nlZLNM=;
        b=sk6ZKLh1g07Ra7+ZprdxIdypw9uVLpZXgQzkfx7Vbm0qnvC+iSFhXX2LP22zdbygsj
         7TodIqOfwmolAyl/04ZowIzkSGnrQJh0brrBwu71EAXSHR3tpTswMS48BRlmKN7aJor8
         UIYqKRWthcUOaSfIIunOtmDdQjhfp+1RougbV8xyxjTkrgfNeY1bZA+ohUBKGkVmvd7p
         QC5yaRdkgdxVSDss29Q3U+cyyga6UoSkNezsFzJ4X6F6hE4cLG5D+GuO9nJWzyotW21U
         2CtkEpYyaGQP//8czN3nfteGMt2FjVW/g71ntzWHfIXFUvOIqFXJ16SMXNvALQl9aJ+3
         wgAQ==
X-Gm-Message-State: AOJu0YzC2v+Cb0lZfm6oYFbQNDeITls8ZEsrcHo8put9f8OX7gWT++RC
	5jBm1jh4OXBW9K21EaePrr9J8yKHIUYF1R0R0uZOZwxlpvQWfDbvpJsg
X-Gm-Gg: Acq92OHRrgQYukNBK3DHgXQPCdlkOHwmsIu7SBGlbuwhrA87eulWaJ6Yu5YJJl9WXZx
	JadFR43fKubk7kYLyL+kgw09hGuMnHtA5dtU/B3qpfTsTx5CpIljn1Z8kppfAzA9sY6m1eEreMm
	McplxyVnrvoPuuLW5u+qg506uPrGU/xcRoX9/spqH59t4nBg78RERaYnlzzNnWXhy7kP0feexKs
	Pyc6Y0jmBA4KAZn6KAh8pRv8d/GAlaXdH0pyLboGTie2oiBUTA01hd3Nr9P36Qhy7Pnn8hFMErL
	WlKwfo9KhuJc9s1ZqAatRDogFDBHM/b8AWMBGU0jr64jJCDXFmEqT/atqKSRTJxFxu9tev02ezK
	sWwLzOjgmpChS7bCw8dbuU2oY6EgbAyCGu/FZXXie3412Cxf3a+Jz8+HCUHOSmQrua8B48oReCy
	xP4j2iN06cdg7/AALsXkg+6jjbxEQvNStYNJS+rzvFZ/IP1+T2aY1JL1rgE1pRd1C2AhFVsZV/7
	F89ThdTAwgtT3dUpk0X+njuYxetP/Bvx/P8ahBhGU39ecI=
X-Received: by 2002:a05:6000:2f81:b0:45e:a0ab:8bd1 with SMTP id ffacd0b85a97d-45eb3688839mr47962842f8f.7.1779976077930;
        Thu, 28 May 2026 06:47:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e50f:a16:236e:f9a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54903csm14013775f8f.6.2026.05.28.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:47:57 -0700 (PDT)
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
Subject: [PATCH 0/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH/SCI pins
Date: Thu, 28 May 2026 14:47:49 +0100
Message-ID: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33284-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 398205F324E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series configures the Ethernet and SCI pins for the
RZT2H-N2H-EVK board. The changes include:
- Removing unused MII/GMII pins from the pinmux configuration.
- Configuring the necessary pins for Ethernet functionality.
- Configuring the necessary pins for SCI0 functionality.

Note, this patch applies on top of next-20260527 + [0]

[0] https://lore.kernel.org/all/20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
  arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
  arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins

 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 144 ++++++++++++------
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 144 ++++++++++++------
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     |   3 +
 3 files changed, 198 insertions(+), 93 deletions(-)

-- 
2.54.0


