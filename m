Return-Path: <linux-renesas-soc+bounces-13648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A9A43C77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 11:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB9618823D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 10:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B6F2676F6;
	Tue, 25 Feb 2025 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="E/L05BNj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E926738B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2025 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481157; cv=none; b=EcjW+LiJ5qPNkZ4SVUYw1o7LS4BB7wd4BPYzE+sRvABgN/p4CEwzSOIa2U9MJPzEh84gXhNgjYb/2luERl308+eJj9GkfJduVFNcwy9dZlMe3ri+zC6bXMz5PhqYUITLHJTBCYuILNs7WH7mzwr7DvF2D6CMrZdyGlTUq3Bz+5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481157; c=relaxed/simple;
	bh=o8r6VoDayWho+fFv7e/gyRno+ziuEWDCAaPrX4Z89JU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MH02gSpn6CPx+8fvNzCu2Z+ow6/aMfku++NFYMrIP4ejfAYIZ8RbjdyInPiwKiHEKDdQHBfWBQO/6tJYkwoKigW1Cj2G5SBAEbxG5YLA/8LdKTMTCjyFD/2Mj2bBOv1TkjRbBpU0LLoyqqBQEYaaI3Dt07pHbp+jEd/jEeTL8Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=E/L05BNj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f406e9f80so4995014f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2025 02:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740481154; x=1741085954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VukLdfasfQBJ7tQS9WN8QAGcoRYc+03mfvZcv/fClqA=;
        b=E/L05BNjXV/0bRMBQWfhyzoIJxIksrRK914J9uGQfIDxZFOSxyluXnAhSf/aSyxrvh
         B5MSDBK4ZrgjJlyWVfLHgnWajA/CmMk3Z1deBTx0dNrLzjNtJ5HX/7QrjGFPYMgLQM8e
         sJo/r2UifbYZkJRaCLQURYu8gbnwLVPb3XR4h3p7XZdma0CaMQ0RLvCtSQuxA55Mtmww
         WgsmBi4bwbYL207YI8v4SyRMNmgDBCHfj0JH6FbXDdkRHMWIt/ByQUFRWMp6fcDve6Xj
         n1HuXvaHr83PbNjThPXdhYKf8QSF3Gs+sD8EXjvNUdjTLpx0OVAGp35iWmliRakdYvIa
         rMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481154; x=1741085954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VukLdfasfQBJ7tQS9WN8QAGcoRYc+03mfvZcv/fClqA=;
        b=Uu1J9h0A64Rkj9j4EbL0aPiuvQ3p0/MRMqBkczvjftkXPTPIxQdd1laKc/ROGegME/
         +a7Hhktai6LsDOjFpYgMYiLCY+YvoFjI6ZEewSRUsV6FIZ/Wm6P+X8uc+03fRs0LPpE+
         r/LlR+kef+vAHNJ56DLWeN0j6RbSuceJtbzfdFsY+I7JNclWtCte2kU5mh3PmWMV7Ity
         zusRKuC/uNH3fbp9NTUl3S19cOEcaAwupPMnjAwzZne/do7lYQNBXxZ6RIOOfYeEATFK
         kolj+jsKboTJzEqO39rIoicOztBp1xfmoRfOS2QpFiJLMkszurKpuYVKJgREmWDpdIeH
         6bUw==
X-Forwarded-Encrypted: i=1; AJvYcCVqX1obWJDk0Yk69UYupR3JxoYB8wviMypQUOUFF+Y2wowyvGg1iIbBVIVYsdVkVgtcPmV2FBawML8jcaYw/X6Qig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpYrct+vh/EANLcO6VTv9SwMopgvd+rNWOGcXRbLuoCZRZEav
	gatTbrN47cfFrMmv0+vUH33rF71MtDUCKWWZvp27BMWutNObPe2LgCsYFJEtt/0=
X-Gm-Gg: ASbGncuzc+50DqghEQ7tFjaqx6FL6Ts57yMghBob6dAuGCw0zEuXmHhHJqCrpYsFpjV
	ZNvU9+JrxjkqFjZjtQxN9ytGtmv0IZ6iHuKYO8UpV6/pkr/59/yP3R4Beav3gI+mqseOusce6/E
	op8gweYyA2WZ7st5gx4frdBMj0nHTyaOeh58icjQ2fKtGL1lx1WL7fWw0ZXx29YBEAqeDmwh0Fm
	vHnjdsMeT88veFbp8Plj7qT8/hEc8xBAYQK6vmZXYCVwQO5m2YiNLGjFn8yfF3n5ErNfOLWNfex
	q6zNiJqUFFuwfFS2Vc9uJAhWAmNBUnj5Vn57KdrIv1q4hsxJ26zqJt8=
X-Google-Smtp-Source: AGHT+IEOkq5gHMIs+2pPeri3jTIlWyLpg/AoBdUKgKzIKml00dWLCYeREqM/1PAF7HKRFa7tW8kiuw==
X-Received: by 2002:a05:6000:4011:b0:38f:457e:3f2b with SMTP id ffacd0b85a97d-38f6e757322mr12822172f8f.6.1740481153865;
        Tue, 25 Feb 2025 02:59:13 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab2c50dcfsm12588815e9.0.2025.02.25.02.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:59:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/5] phy: renesas: rcar-gen3-usb2: Fixes for Renesas RZ/G3S
Date: Tue, 25 Feb 2025 12:59:02 +0200
Message-ID: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series add fixes for the Renesas USB2 PHY driver identified while
working on the Renesas RZ/G3S USB support. These changes are
needed for the upcomming RZ/G3S USB support (especially for the
power management support).

Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
unbind/bind and data transfer tests before/after the unbind/bind.

The unbind/bind was also tested on the devices with the following
device trees but w/o checking the data transfer (as I only had
remote access w/o USB devices connected):
- r8a7742-iwg21d-q7.dts
- r8a7743-iwg20d-q7.dts
- r8a7744-iwg20d-q7.dts
- r8a7745-iwg22d-sodimm.dts
- r8a77470-iwg23s-sbc.dts
- r8a774a1-hihope-rzg2m-ex.dts
- r8a774b1-hihope-rzg2n-ex.dts
- r8a774e1-hihope-rzg2h-ex.dts
- r9a07g043u11-smarc.dts
- r9a07g044c2-smarc.dts
- r9a07g044l2-smarc.dts
- r9a07g054l2-smarc.dts
- r9a07g043f01-smarc.dts

Thank you,
Claudiu Beznea

Changes in v2:
- dropped RFT
- collected tags
- fixed checkpatch.pl warnings

[1] https://lore.kernel.org/all/20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (5):
  phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
  phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
  phy: renesas: rcar-gen3-usb2: Lock around hardware registers and
    driver data
  phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
  phy: renesas: rcar-gen3-usb2: Set timing registers only once

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 135 +++++++++++++----------
 1 file changed, 75 insertions(+), 60 deletions(-)

-- 
2.43.0


