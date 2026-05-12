Return-Path: <linux-renesas-soc+bounces-32522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANjQARKRA2ru7QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 22:44:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4E15297F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 22:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E359D31D40BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC953C5835;
	Tue, 12 May 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxvBYi6M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603CF3C456F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617778; cv=none; b=eZk4kmAzWPx+4kFQf9OMYro0+2bjVmcFh4PyTOxgAsTkEs9PnjhQFnicFvgn7dLtPXljliV08DLFV3nLUOAzno/g+sgkaDiAcuySDFNv4vgZZrXs1lAVss/L26uqPxkdS8vPTdU68HP+ge3wUEISy1X0T6KJoMBxtGPJCvQPggw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617778; c=relaxed/simple;
	bh=9+d9DA+2u9lo4UNQ8lVccw1/tfPriiuFVSc+pacyDTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EplgVE2mAGTLkg79wXjvQqNAWnxpQEpXEtK5vnBEpfaAzm655z7HuObFcMZHFiB6h1xm4AnOPzuRYYt6BZUYRJHI01u4Gj9vVCfvyewj/DxCdTikFFxJuyT8q6cQM3OIJD5D1dBYuwmlZ3Mt92zA5s1dFWhwzc/0xlNmXQJajP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxvBYi6M; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ba840146so53775265e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778617775; x=1779222575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=718MVFj4b+rdA+Skqd/sKif3e/MndwJ2n/ALSewbJow=;
        b=YxvBYi6M9XLBJBy7MD9fnb0zMZPGBysPGCUmTW03nEr2Y/tcmUFCxG0cHOA/ao1dGL
         etuxtoCloTOmbZ0Bx7OgyuR2++aoZcUxvhvNHe96YyDql+fUKq2rv82mDkTeTNf/TJk1
         Co2OWKdyXpLxZ7NB9BVmf1h8nhateaNHbp6ZxRYlm4BUVBWJxDMQfMFT387e+bPV6fPC
         cLsC5gak6EauTh+CbNxhqw9EobkeVhW5lb2hrbfH0p24CSc9uWlN8+I/0SzrXBo8Re6G
         dv5tT/h8cObHAHjlmMCHebrT5yaseXUQHVOlxrUWIjYP2djUkhYLnbtps/bJOle72ufG
         C4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778617775; x=1779222575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=718MVFj4b+rdA+Skqd/sKif3e/MndwJ2n/ALSewbJow=;
        b=INvKvDGsTGlMIV7qjEKR6UVLnM9iswkg0RzkzsPQDYTXuq9Clip1oCdEJLkb0bEO28
         rXWIsAoCgYRMPzhRqwZLeUcbYEoQsX0GjleMwOmJXCE/dstcpEkBV/tdTa4jzoIuCY26
         uURp1+Tzd4jQ25BxI5M/LanvmC82enBhUG+KscC4vtBgnu5zwH9tK0mmQg8IuY2/6pAH
         I5R7aQ84Y6x6AMtik7W+dP7wyfL71cBAgKoMtJGemG5YKpi0Mo+PlA37aj6DSPQBsqCF
         T0eEn4q5fFA803KRgJlAh6XBNCbjth8P00/XOm5NpOF5KGdwVeb5dCIImpS3iIlzzhLR
         bAfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OrYEwO9YPAFV1TL3K7Q5TeVfcW0Y4ejLa52bYZt/Ne2ZQJyfFDOJvWn36RbQuU9EPEP0Qf0hx17FQL85nFt9cwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFiiyh9y6F3q9jL+Qtvv4f/Y/m+bxyzYH9ScqB1bPVPUV01pQ
	1mWI3n75AYrNpFtHwSZXtEEGzr5+ll6GoInk/MnxH1o++kllZTkW33SC6w6DDJmIPyE=
X-Gm-Gg: Acq92OE+SRjbhE7tL9wqmgZ3xBFMMsk/+NFJgQwJqIipPOd/QKDxX87v08CIw9/7Nsb
	602Hoiv3yz8X15PdaT/EqoEqYCrLZ+87vofQlF/ENUnpMpn4qKbuuc1wdKwqMmGsTCCG5tARESq
	k+mm6g7957KIQBQmNVM+yEFbe0gp1vS/ICgsJtL3nh+3bw2kjjeO8INzxWwgB1B855FLMCMp3qd
	r9J0OBRXj4O9XXDEAbpnNOJyAnx8qgCuP3SbT6EcChpEZCGn3/bLfiFVffwGSmHyRyrgHNRjRnQ
	BD4tfG60QUrRKCE4HaUZx0wOJDXTYVxSQyhUVTkDHvChNqPHZZnnST+UHpm7EPrIypFEkynUYpW
	gUp9D44zDPC6xvFL1FDFD1Xb63WFsPPux7wSV3i6Q5BRbQk1tfGKjsL9upO0vR9I9GcfzHJbfKa
	N0F+ZlgycrG8wQX5w00sNUY7uV8VUiHWYzaRoOZEX7ReivbxricW41uEZTZgx57V9z1UHpQcU4q
	oAeenZgAEe3uL1s4QK/WYaqSBrrJsMjl2g=
X-Received: by 2002:a05:600c:4ecc:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48fc9a391fbmr6177355e9.21.1778617774632;
        Tue, 12 May 2026 13:29:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d27d31sm36899415e9.8.2026.05.12.13.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:29:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: rcar-vin: Enable NV12 support for RZ/G2H
Date: Tue, 12 May 2026 21:29:31 +0100
Message-ID: <20260512202931.1051379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D4E15297F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32522-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[ragnatech.se,ideasonboard.com,kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/G2H (R8A774E1) SoC supports outputting NV12 format, but
this capability is currently not advertised by the driver.

Set the .nv12 flag to true in the rcar_info_r8a774e1 structure to enable
support for this format.

Fixes: fe98df32bd9e4 ("media: rcar-vin: Enable support for R8A774E1")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..e16b33096fd2 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -925,6 +925,7 @@ static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
 
 static const struct rvin_info rcar_info_r8a774e1 = {
 	.model = RCAR_GEN3,
+	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a774e1_routes,
-- 
2.54.0


