Return-Path: <linux-renesas-soc+bounces-31760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y8iBGzA58mlopAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:00:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED09497DA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42D69300B451
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 17:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2342410D13;
	Wed, 29 Apr 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZcclmEg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5756940245A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482023; cv=none; b=XcwHqkZ4HsNtTSfKPyXDKyRzOuW9lc6rOHxQjIs2D++OiSHI7wp5y1DrcoYs9mJt1l+OJ1SJlsrQqYmSfORDf195hoonoQlgKmLnnM2Hj5XlfWiLW78LvOQLvTgeBRl1zkKXpO8M1vqrzl2eeGDgLh2c5quI9XEyUlR698s0kgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482023; c=relaxed/simple;
	bh=hVrVQBsFImR/2XU+zhOryibYPHrZHx7DKwW6/uwn6+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YtCSE9dBtnlucpM0oJ5bdmnhTQEkIpdX5/OoBFuAqtkZXGOPkak/4d4CHILXMQtFhcHewrS34E+olPRFXyIMTJ43icoP/trLBM68F3j+9sA6F9i3mIfcalxdv4dnZ/o/xiBCG//U/eKlxlCKeOXfvxpoGg/wOUaFgYhDGjbMb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZcclmEg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so154902925e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482021; x=1778086821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aidcyvjPbKTT3kmsb998TSQGc1MaHBcE23aYVUk7JtU=;
        b=NZcclmEgkfQ8wtDpSJBtYodpwTGjpQ/qGLUNqotaG6mjoCWa8SBk37k5nO1OhoAPK3
         kanwR3/eIxfk83Lwf5LM3yjj2/t18+TcV9qPJJpNLlJm3PEUCpxhGCY+R0KEB+8Lztva
         cM76/8ya7Leiyeotr0rb11oWWtmI39Q3VDJKTnei/kC9PJrqQ57cs4+bDDf71ZPhKRIH
         mIRxdM+wZgbhKm0T028GtyIGGIE8yxK4pDkVyl0Bowcrg07yz17z7T1Y3c0LqrADCW2g
         Icbnvhj94vA3dPma2HJccpJCnr1Eoh5l9xuBChaF5Az335mAIejKR/vZ9LktHspL3IBi
         fhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482021; x=1778086821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aidcyvjPbKTT3kmsb998TSQGc1MaHBcE23aYVUk7JtU=;
        b=UveefVBm8Yg4hQmU0hbNNwcTaXMOb/5AWqi0aft7F6PWW1WfLfEZx2lpACWbiUgYBj
         MvDeNbgy5/cvDZTmgQNrzu1kSpR7Ioxcp1rY+cRV2FXkkvlKtjKDrCzVcifeJmTqC85Z
         hxHco5Pv1PpcxPND7+UlC0UxaBfyxdaAldzR2R85EYKqsjPNt+34SFBlVXIa9YbYboft
         ioY9fit9mYELjqb9X4UwmXCOzGVpu3aAf69Iy75fI1Wt2AVjRdT/41p6M7MX4dNjWThF
         s10UGCAJMzXk4LpUk0soLyr4f6yvvu3cS+flTaxvV1W/g22g3i9ybCnLPHGj9gOwETba
         TtoA==
X-Gm-Message-State: AOJu0YwFHSQSA6IdnraFC+DBFtQsgApeqlanJEoNDucVVxfVQQ8MaN3f
	Cj7JW0RGVbY48McuxSBSN22vzc35IsHqOY2Meg1yfk4jz+Efed7wolXm
X-Gm-Gg: AeBDiev+kWjosps7FPjhstPu8baMXAGaavFH4/fbVD36IRfIHmn4Kt8xP/uurXrI641
	VbmvvExIimn6r9F+RvBsCKXXgdXg2K03TAzZewQfZMdTd6Jd6SGg2ymMUncdKkrb2aIBDoHbAIe
	neqYls8Bp4pk61eGSx+kitkAV51YpjBMDtOV94rlbFTAcYVrzp67PjEZLvZRXFJFNn6PMs28FYt
	py0QAr6OSDSabfbHaWrLCAbtBJSK+Obo2HtcEPopw7bb8YRo8PblHOQwtOonR0ikapTc/ZbgSc5
	37d7WnIx31W0D8buWyxY+fFFsTTkzrvC7IQevKPMj+A61DTVUGy+HuPnve7GulnI2oBt03tJUCp
	uEDMaTBFW1HYSrUopSlLRtpoGh1mjpyZ7RsYh3X5UVzCB4uTKwUe3/ru8imNC+Z7EJGZXg3KC38
	1WC2DMPjjkg0QTsQ+9utlWuxzDmAiaHGTwBYTKRiLaHKiYs2FTT41L4WNOcMW6IIibKCBIaQWUC
	2Ure4Pp3o0QWf9g0zX0dvwNsQSgK/SyiQbOzZUFNRzC3Nbt
X-Received: by 2002:a05:600c:8b04:b0:48a:53ea:13eb with SMTP id 5b1f17b1804b1-48a77ad5a7emr130239205e9.5.1777482019068;
        Wed, 29 Apr 2026 10:00:19 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add DU support for RZ/T2H and RZ/N2H SoCs
Date: Wed, 29 Apr 2026 18:00:08 +0100
Message-ID: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1ED09497DA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31760-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the Display Unit (DU) on the RZ/T2H
and RZ/N2H (R9A09G087) SoCs. The DU on these platforms is
functionally similar to the RZ/G2UL DU but includes some SoC
specific differences such as a single output port and explicit
DPI output enable control. The series includes the following
changes:
1. Add device tree bindings for the RZ/T2H and RZ/N2H DU variants,
   including a new compatible string and port property.
2. Make the DU reset control optional to allow probing on RZ/T2H
   where the DU does not have a reset line.
3. Move pixel clock validation logic to per-SoC constraints in
   rzg2l_du_device_info to accommodate different clock limits
   across SoCs.
4. Implement support for the RZ/T2H DU variant in the driver,
   including handling of the DPI output enable signal.

Patches are rebased on next-20260429 and apply on drm-next.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
  drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
  drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
  drm: renesas: rz-du: Add support for RZ/T2H SoC

 .../bindings/display/renesas,rzg2l-du.yaml    | 24 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 +++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 16 +++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 14 +++++++++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  6 ++++-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  2 ++
 6 files changed, 66 insertions(+), 5 deletions(-)

-- 
2.54.0


