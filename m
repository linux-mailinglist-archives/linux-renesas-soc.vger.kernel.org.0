Return-Path: <linux-renesas-soc+bounces-32824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN1vG4WSDGp1jAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:40:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C540F582863
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB413178C0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAFD3ED3D8;
	Tue, 19 May 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3w/GFFk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8F31327D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206926; cv=none; b=pAdNysAjbxdXmIsJ0Nae3cD3+QgqI1YVp9d322ZbrNL6TfEEFjq43O6QQRDhOGKRHyQc/IqqKN/bckoh8uhAcAjL5QV69w7lZRWngwE5c5L5p+p2dMwKlKJeL2ndblfFOLBP1FNbQPczJEwCy0+hbJUk4Qoao+qAexQ/G3cJZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206926; c=relaxed/simple;
	bh=A+yoSoKj7bowNjrT/qO9FE96PQ7mxA4+K9JfLWTgufg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cx/2bu9P8nuhZ2SAx34XQRrysKhcFIUB238463GimMkNPFn5oWgmWlkibsd9dnAntIrX8U7ZbiqaOFLWdg8+qK8oqQaefOxiHzI2mxq8J6lsOsoHXZsOqfX5bze3L5oLoDqsF3lnw2NyD1ukPkfgddIMgoZI/onmm/B0vdNbjjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3w/GFFk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so41911765e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206923; x=1779811723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxS3QQnk5GN7d0xeWk5k+vZ7DrxTc2p5byKRqEc/Aw0=;
        b=K3w/GFFkSkFhGUM/8iRFReXCNW3BopNaZX2JdirSq1tkGIgO4Rfb8tUU9f/oGVW1oU
         LHczQEUzfEq88fvSwpCzyAXdk5OFEu8t7bsnkJx+X3O0nMzjEa8tPn5WlJzuRi3r2ruQ
         85xooOnNM7YufRNGM/CJiyrx4MpkHA1UJknPHoGg0E67DQ2bX5CNO1XaTd2BHHYzmmsq
         lCFGMV5+3Kt8/gYREkKJqwYlKaQkAJSY4qVpYNkWLtLuKoHFVUMr9QHwzZNGcA29YSu+
         psoZhMUN9tvFewT34NSkt83CvgvvhelTvLeX0LPzfKVtRrAlpa64xAoH6V8BCs4AWhEf
         9VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206923; x=1779811723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxS3QQnk5GN7d0xeWk5k+vZ7DrxTc2p5byKRqEc/Aw0=;
        b=Tnf0msho7gUBzEz53nY1DrXVikswPTYIzmOVmkEZh1ARyG44JBWGAAgTVaIp+cPhi8
         Wj0aiLUOgQ8of31/gWM1q3O20uPx+Q7AHXf7Ws8GtwASWmlVNe/YOt139OgumcdYTWmb
         qQEV2vmQiXX9OtM1UFQ/0wCmO/SHHljQTuNc/W2m3xH0cswDojege761cl5qnNyRE6YY
         kx27RFGkf1JUmK7M3LBnlRfX9840Qn0WQbmFtA7IdgkRP6F9J1z3XN0eYpLKXtoe2ALb
         114Yr81sXm2U9fCqafpJgFkm3JVp6veZhDvLsJNNFSd49OV84NlDKda6pgZqRpNpkDC/
         xNKw==
X-Forwarded-Encrypted: i=1; AFNElJ85QYsQnwQYMWnBYSQXTzO4yJkWDWOxF1XUGvLb8X3Ont2cOPEPQBBEoo4XMpPuw6r8FmyjS4RFsOSPU5xvt0UH1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw31pGRp4WTANKm9PgEiU8FQO8mKo3idP5w4Yloe+VAyYLqJKKS
	7oxdwnOaacgvqMwd/PTAXc5PxgdxKw7PYtPk5nlZojlfn5ocx/KQuLwm
X-Gm-Gg: Acq92OGm1U0qC15JJQFICfT9eWKN6ODodMwPM/Z0/X4StKSplQeP/L8K9Q6GQJqwU9/
	ks/2PuYr9zQl86rlUm0zcRAhyxyQVAIh8ZqXRZ+pFZh4fBGNCEXTi98lDYAypGeJAE+mmTR8tiF
	jiUlddV79cMjcgjtTWjIGZUKZacRIZnNpAaCdYxB+qkPAOF+iC2nZSJgIy6dV1u0PqdqDhzCPNq
	GizM/MaF/AJVNPd3XoZqH6tH68myqbA/HTicQlKGEXpCGMdvWylPI6KVv2wWWgOXQXKawDAmlF0
	dID1FwSdxwv4GsDBQZ5KwuDhv73NIelHhszS5sEO1x2Q7gUI719v8VlmjIMN4yup3hScGxXnm4f
	vWVEib/wbFVLvA2s0MbU+/do+lQ/aR5LNeYTrviChzJGgeVHc0ONsKjSePijblFU4lkc+QtTdqe
	ohy813Gde3ZX+z3AupUttPT0pJV6O08T5ZQkEi1v0rViBbs1+nNxsqwvdHbBBk4tk06RYTeWqCC
	aZF48FiNQuVEvBCi/B9ETHFodfj7CSw2n+5ZPKclSZLsCv8
X-Received: by 2002:a05:600c:491e:b0:48e:978f:c45a with SMTP id 5b1f17b1804b1-48fed455991mr192575895e9.19.1779206923119;
        Tue, 19 May 2026 09:08:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/5] Add DU support for RZ/T2H and RZ/N2H SoCs
Date: Tue, 19 May 2026 17:08:20 +0100
Message-ID: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32824-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: C540F582863
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the Display Unit (DU) on the RZ/T2H
and RZ/N2H (R9A09G087) SoCs. The DU on these platforms is
functionally similar to the RZ/G2UL DU but includes some SoC
specific differences such as a single output port and explicit
DPI output enable control. The series includes the following
changes:
1. Add device tree bindings for the RZ/T2H and RZ/N2H DU variants,
   including a new compatible string.
2. Make the DU reset control optional to allow probing on RZ/T2H
   where the DU does not have a reset line.
3. Move pixel clock validation logic to per-SoC constraints in
   rzg2l_du_device_info to accommodate different clock limits
   across SoCs.
4. Implement support for the RZ/T2H DU variant in the driver,
   including handling of the DPI output enable signal.

Patches are rebased on next-20260519 and apply on drm-next.

v3->v4:
- Added Acked-by tag from Rob for patch #1
- Added Reviewed-by tag from Rob for patches #2
- Dropped per pad limits in patch #4 and added
  a check to return early if the output is not DPAD0,
  as the clock limits only apply to that output.
- Updated commit message in patch #4

v2->v3:
- Rebased on latest next-20260508.
- Included Tommaso's patch to refuse port@1 for RZ/G2UL, which was
  previously in a separate series.
- Moved clock limits from device_info to output_routing to allow
  per-output constraints.
- Updated commit message for patch#4

v1->v2:
- Dropped the "port" property in favor of "ports" with a single port@0
  child, to align with the existing RZ/G2L bindings and simplify the
  device tree structure.
- Updated the commit message to reflect the change from "port" to "ports".
- Dropped storing info pointer in struct rzg2l_du_encoder as it's not
  needed.
- Add Reviewed-by tags from Laurent for patches 2-4.
- Rebase on latest next-20260507.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
  drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
  drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
  drm: renesas: rz-du: Add support for RZ/T2H SoC

Tommaso Merciai (1):
  dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL

 .../bindings/display/renesas,rzg2l-du.yaml    | 21 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 ++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 20 +++++++++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 14 +++++++++++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  9 +++++++-
 5 files changed, 67 insertions(+), 6 deletions(-)

-- 
2.54.0


